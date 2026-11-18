from odoo import fields, models

CANALES_VENTA = [
    ("tienda", "Tienda"),
    ("telefono", "Teléfono"),
    ("web", "Web"),
    ("distribuidor", "Distribuidor"),
]

class ResPartner(models.Model):
    _inherit = "res.partner"

    canal_preferido = fields.Selection(
        selection=CANALES_VENTA,
        string="Canal preferido",
    )