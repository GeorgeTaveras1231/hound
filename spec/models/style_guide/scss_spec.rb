require "rails_helper"

describe StyleGuide::Scss do
  describe "#file_review" do
    it "returns an incompleted file review" do
      style_guide = build_style_guide
      commit_file = build_commit_file(filename: "lib/a.scss")

      result = style_guide.file_review(commit_file)

      expect(result).not_to be_completed
    end

    it "schedules a review job" do
      allow(Resque).to receive(:enqueue)
      style_guide = build_style_guide("config")
      commit_file = build_commit_file(filename: "lib/a.scss")

      style_guide.file_review(commit_file)

      expect(Resque).to have_received(:enqueue).with(
        ScssReviewJob,
        filename: commit_file.filename,
        commit_sha: commit_file.sha,
        pull_request_number: commit_file.pull_request_number,
        patch: commit_file.patch,
        content: commit_file.content,
        config: "config"
      )
    end
  end

  describe "#file_included?" do
    it "returns true" do
      style_guide = build_style_guide

      expect(style_guide.file_included?(double)).to eq true
    end
  end

  private

  def build_style_guide(config = "config")
    repo_config = double("RepoConfig", raw_for: config)
    StyleGuide::Scss.new(repo_config, "ralph")
  end
end
