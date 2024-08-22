namespace interview;
using { cuid } from '@sap/cds/common';

entity Projects : cuid {
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  startDate: Date;
  endDate: Date;
  status: String(20);
  tasks: Composition of many Tasks on tasks.project = $self;
}

entity Tasks : cuid {
  name: String(100) @assert.unique @mandatory;
  description: String(500);
  dueDate: Date;
  priority: String(20);
  completed: Boolean;
  category: Association to Category;
  project: Association to Projects;
}

entity Category : cuid {
  name: String(50) @assert.unique @mandatory;
  description: String(100);
  tasks: Association to many Tasks on tasks.category = $self;
}

