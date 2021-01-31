require 'rails_helper'

RSpec.describe InfosController, type: :controller do
  describe 'POST /upload' do
    before do
      post :upload, params: { file: fixture_file_upload('spec/fixtures/files/suppliers.csv') }
    end
    
    context 'when the request is valid' do
      it 'saves file' do
         Info.last.name.should == 'suppliers.csv'
      end

      it 'enques and executes the job' do
        expect { ImportProductsWorker.perform_async(file_fixture("suppliers.csv"), Info.last.name) }
                                     .to change { ImportProductsWorker.jobs.size }.by(1)
        Sidekiq::Worker.drain_all
        expect(Supplier.first.code).to eq(1)
        expect(Supplier.first.name).to eq("Ortiz-Schultz")
      end
    end
  end
end