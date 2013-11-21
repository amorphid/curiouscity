class Admin::Home < SitePrism::Page
  set_url "/admin"

  elements :recent_questions, ".recent-question"
  elements :recent_answers, ".recent-answer"
  elements :recent_updates, ".recent-update"
  elements :recent_notes, ".recent-note"
  elements :recent_tags, ".recent-tag"
end