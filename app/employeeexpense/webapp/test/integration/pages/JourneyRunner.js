sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/expensereport/employeeexpense/test/integration/pages/EmployeesList",
	"com/demo/expensereport/employeeexpense/test/integration/pages/EmployeesObjectPage",
	"com/demo/expensereport/employeeexpense/test/integration/pages/ExpensesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, ExpensesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/expensereport/employeeexpense') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheExpensesObjectPage: ExpensesObjectPage
        },
        async: true
    });

    return runner;
});

