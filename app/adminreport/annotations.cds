using AdminService as service from '../../srv/admin-service';
// Define the ExpenseItemsGroup FieldGroup

annotate service.Expenses with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Trip Name',
                Value : tripName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Trip Date',
                Value : tripDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'ExpenseItemsFacet',
    Label  : 'Expense Items',
    Target : 'items/@UI.LineItem'   
}

    ],
    UI.Identification : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'approve',  
            Label  : 'Approve'
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'reject',   
            Label  : 'Reject'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'TripName',
            Value : tripName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Trip Date',
            Value : tripDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
    ],
);
annotate service.ExpenseItems with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : amount
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : currency_code
        },
        {
            $Type : 'UI.DataFieldForUrl',
            Label : 'Receipt',
            Url : { $Path : 'receipt/$value' },
            Value : { $Path : 'receipt' }
        }
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : amount
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : currency_code
        },
        {
            $Type : 'UI.DataFieldForUrl',
            Label : 'Receipt',
            Url : { $Path : 'receipt/$value' },
            Value : { $Path : 'receipt' }
        }
    ]
);
annotate service.Expenses with {
    employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employee_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};
annotate AdminService.ExpenseItems with {
  receipt @(
    UI.DataFieldWithUrl : {
      Value : receipt,
      Url   : receipt,            // will call $value stream
      Label : 'Download Receipt'
    },
    UI.IsImageURL : true          // renders as image (if it’s an image type)
  );
};
annotate service.ExpenseItems with @(
  UI.HeaderInfo : {
    TypeName       : 'Expense Item',
    TypeNamePlural : 'Expense Items',
    Title          : { Value : description },
    Description    : { Value : amount }
  },

  UI.FieldGroup #ItemInfo : {
    Data : [
      { Value : description, Label : 'Description' },
      { Value : amount,      Label : 'Amount' },
      { Value : currency,    Label : 'Currency' },
      {
        $Type    : 'UI.DataFieldForFileUpload',
        Value    : { $Path : 'receipt' },
        Label    : 'Upload Receipt',
        FileName : { $Path : 'description' },
        MimeType : 'image/png'
      }
    ]
  }
);


