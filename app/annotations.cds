using { interviewSrv } from '../srv/service.cds';

annotate interviewSrv.Projects with @UI.HeaderInfo: { TypeName: 'Project', TypeNamePlural: 'Projects', Title: { Value: name } };
annotate interviewSrv.Projects with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate interviewSrv.Projects with @UI.Identification: [{ Value: name }];
annotate interviewSrv.Projects with @UI.DataPoint #startDate: {
  Value: startDate,
  Title: 'Start Date',
};
annotate interviewSrv.Projects with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate interviewSrv.Projects with {
  description @title: 'Description';
  startDate @title: 'Start Date';
  endDate @title: 'End Date';
  status @title: 'Status'
};

annotate interviewSrv.Projects with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status }
];

annotate interviewSrv.Projects with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: startDate },
    { $Type: 'UI.DataField', Value: endDate },
    { $Type: 'UI.DataField', Value: status }
  ]
};

annotate interviewSrv.Projects with {
  tasks @Common.Label: 'Tasks'
};

annotate interviewSrv.Projects with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#startDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' }
];

annotate interviewSrv.Projects with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Tasks', Target : 'tasks/@UI.LineItem' }
];

annotate interviewSrv.Projects with @UI.SelectionFields: [
  name
];

annotate interviewSrv.Tasks with @UI.HeaderInfo: { TypeName: 'Task', TypeNamePlural: 'Tasks', Title: { Value: name } };
annotate interviewSrv.Tasks with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate interviewSrv.Tasks with @UI.Identification: [{ Value: name }];
annotate interviewSrv.Tasks with {
  category @Common.ValueList: {
    CollectionPath: 'Category',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: category_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
    ],
  }
};
annotate interviewSrv.Tasks with {
  project @Common.ValueList: {
    CollectionPath: 'Projects',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: project_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'startDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'endDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
    ],
  }
};
annotate interviewSrv.Tasks with @UI.DataPoint #dueDate: {
  Value: dueDate,
  Title: 'Due Date',
};
annotate interviewSrv.Tasks with @UI.DataPoint #priority: {
  Value: priority,
  Title: 'Priority',
};
annotate interviewSrv.Tasks with {
  name @title: 'Name';
  description @title: 'Description';
  dueDate @title: 'Due Date';
  priority @title: 'Priority';
  completed @title: 'Completed'
};

annotate interviewSrv.Tasks with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: priority },
    { $Type: 'UI.DataField', Value: completed },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
];

annotate interviewSrv.Tasks with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: dueDate },
    { $Type: 'UI.DataField', Value: priority },
    { $Type: 'UI.DataField', Value: completed },
    { $Type: 'UI.DataField', Label: 'Category', Value: category_ID }
  ]
};

annotate interviewSrv.Tasks with {
  category @Common.Text: { $value: category.name, ![@UI.TextArrangement]: #TextOnly };
  project @Common.Text: { $value: project.name, ![@UI.TextArrangement]: #TextOnly }
};

annotate interviewSrv.Tasks with {
  category @Common.Label: 'Category';
  project @Common.Label: 'Project'
};

annotate interviewSrv.Tasks with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#dueDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#priority' }
];

annotate interviewSrv.Tasks with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate interviewSrv.Tasks with @UI.SelectionFields: [
  category_ID,
  project_ID
];

annotate interviewSrv.Category with @UI.HeaderInfo: { TypeName: 'Category', TypeNamePlural: 'Categories', Title: { Value: name } };
annotate interviewSrv.Category with {
  ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
};
annotate interviewSrv.Category with @UI.Identification: [{ Value: name }];
annotate interviewSrv.Category with {
  description @title: 'Description'
};

annotate interviewSrv.Category with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: description }
];

annotate interviewSrv.Category with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: description }
  ]
};

annotate interviewSrv.Category with {
  tasks @Common.Label: 'Categories'
};

annotate interviewSrv.Category with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate interviewSrv.Category with @UI.SelectionFields: [
  name
];

