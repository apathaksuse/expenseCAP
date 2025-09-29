sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/adminreport/adminreport/test/integration/pages/ExpensesList",
	"com/demo/adminreport/adminreport/test/integration/pages/ExpensesObjectPage",
	"com/demo/adminreport/adminreport/test/integration/pages/ExpenseItemsObjectPage"
], function (JourneyRunner, ExpensesList, ExpensesObjectPage, ExpenseItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/adminreport/adminreport') + '/test/flp.html#app-preview',
        pages: {
			onTheExpensesList: ExpensesList,
			onTheExpensesObjectPage: ExpensesObjectPage,
			onTheExpenseItemsObjectPage: ExpenseItemsObjectPage
        },
        async: true
    });

    return runner;
});

