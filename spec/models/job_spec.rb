require "rails_helper"

RSpec.describe Job, :type => :model do
  it 'should be valid' do
    job = Job.create()
    expect(job).not_to be_valid
    expect(job.errors[:title]).to include("can't be blank")
    expect(job.errors[:location]).to include("can't be blank")
    expect(job.errors[:description]).to include("can't be blank")
    expect(job.errors[:category]).to include("can't be blank")
  end


  describe "#recent?" do
    before do
      @company = Company.create(name: 'Campus Code',
                                location: 'São Paulo',
                                phone: '11 2369 3476',
                                mail: 'contato@campuscode.com.br')

      @category = Category.create(name: 'Desenvolvedor')
    end


    context "created today" do
      it "is recent" do
        job = @company.jobs.create(title: 'Desenvolvedor Rails',
                                   description: 'Desenvolvedor Full Stack Rails',
                                   location: 'São Paulo - SP',
                                   category: @category)
        expect(job).to be_recent
      end
    end

    context "created 6 days ago" do
      it "is not recent" do
        job = nil
        travel_to 6.days.ago do
          job = @company.jobs.create(title: 'Desenvolvedor Rails',
                                     description: 'Desenvolvedor Full Stack Rails',
                                     location: 'São Paulo - SP',
                                     category: @category)
        end
        expect(job).to_not be_recent
      end
    end

    context "created 4 days ago" do
      it "is recent" do
        job = nil
        travel_to 4.days.ago do
          job = @company.jobs.create(title: 'Desenvolvedor Rails',
                                     description: 'Desenvolvedor Full Stack Rails',
                                     location: 'São Paulo - SP',
                                     category: @category)
        end
        expect(job).to be_recent
      end
    end
  end
end
