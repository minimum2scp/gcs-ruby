require "spec_helper"

describe Gcs do
  it "has a version number" do
    expect(Gcs::VERSION).not_to be nil
  end

  describe "read_partial" do
    before do
      skip "credential required." unless @credential_available
      @api = Gcs.new(@email, @private_key)
    end
    it do
      buf = @api.read_partial("gs://gcp-public-data-landsat/index.csv.gz", limit: 100)
      expect(buf.bytesize).to be < 4*1024
    end
  end
end
