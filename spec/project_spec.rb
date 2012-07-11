require 'donors_choose'

describe DonorsChoose::Project do
  let(:test_title) { "A test project" }

  it "is able to find projects near me" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:centerLat => "40.4405556", :centerLong => "-79.9961111").
      and_return(projects)

    results = described_class.near_me("40.4405556", "-79.9961111")
    results.should eq(projects)
  end

  it "is able to find projects by zip code" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:zip => "15232").
      and_return(projects)

    results = described_class.by_zip("15232")
    results.should eq(projects)
  end

  it "is able to find projects by state" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:state => "WA").
      and_return(projects)

    results = described_class.by_state("WA")
    results.should eq(projects)
  end

  it "is able to find projects by subject prefix code and subject code" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with("subject1" => "-1").
      and_return(projects)

    results = described_class.by_subject("1", "-1")
    results.should eq(projects)
  end

  it "is able to find projects by grade type" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:gradeType => "1").
      and_return(projects)

    results = described_class.by_grade_type("1")
    results.should eq(projects)
  end

  it "is able to find projects by state and subject" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:state => "WA", "subject1" => "-1").
      and_return(projects)

    results = described_class.by_state_and_subject("WA", "1", "-1")
    results.should eq(projects)
  end

  it "is able to find projects by state and grade type" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:state => "WA", :gradeType => "1").
      and_return(projects)

    results = described_class.by_state_and_grade_type("WA", "1")
    results.should eq(projects)
  end


  it "is able to find projects by subject and grade type" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with("subject1" => "-1", :gradeType => "1").
      and_return(projects)

    results = described_class.by_subject_and_grade_type("1", "-1", "1")
    results.should eq(projects)
  end

  it "is able to find projects by state, subject, and grade type" do
    projects = [double]
    DonorsChoose::Request.should_receive(:get).
      with(:state => "WA", "subject1" => "-1", :gradeType => "1").
      and_return(projects)

    results = described_class.by_state_and_subject_and_grade_type("WA", "1", "-1", "1")
    results.should eq(projects)
  end
end
