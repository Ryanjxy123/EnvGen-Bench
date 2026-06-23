# Document Brief Cases

Cases where the agent must extract key information from documents before
generating an image.

Do not retain `qa_render/` folders in document brief cases. If a PDF needs to be
rendered for construction or visual QA, treat the rendered images as temporary
intermediate artifacts and remove them before finalizing the case.
