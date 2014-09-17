class HomePage < Page
  def visit_page
    visit "/"
  end

  def visit_demo
    visit_page
    find(test_selector("view-demo")).click
  end
end
