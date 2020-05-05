require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #Testing by Erik Eskeland


  test "Report creation" do
    Report.create(data: 1010, report_type: "Revenue")
    report = Report.last
    assert report.data == 1010 && report.report_type == "Revenue"
  end

  test "Report Deletion" do
    Report.create(data: 1010, report_type: "Revenue")
    report = Report.last
    Report.last.destroy
    assert !Report.find(report).present?
  end


end
