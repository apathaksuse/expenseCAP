const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
  const { Expenses } = this.entities;

  this.on('approve', Expenses, async (req) => {
    const { ID } = req.params[0];
    await UPDATE(Expenses).set({ status: 'Approved' }).where({ ID });
    return true;
  });

  this.on('reject', Expenses, async (req) => {
    const { ID } = req.params[0];
    await UPDATE(Expenses).set({ status: 'Rejected' }).where({ ID });
    return true;
  });
});
