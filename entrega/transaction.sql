BEGIN TRANSACTION;

UPDATE OR ROLLBACK cuenta
SET balance = balance - 100000
WHERE account_id = 200;

UPDATE OR ROLLBACK cuenta
SET balance = balance + 100000
WHERE account_id = 400;

INSERT OR ROLLBACK INTO movimientos (movimiento_id, numero_cuenta, monto, tipo_operacion, hora)
VALUES (NULL, 200, 1000, "transferencia", datetime()),
	(NULL, 400, 1000, "transferencia", datetime());

COMMIT;
