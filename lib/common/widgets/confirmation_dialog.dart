import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String message;
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  const ConfirmationDialog({
    super.key,
    required this.message,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Colors.transparent, // Hacer el fondo del diálogo transparente
      //backgroundColor: Colors.white.withOpacity(0.5), // Fondo semitransparente

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.white.withOpacity(0.5), // Fondo semitransparente

          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFF276749),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onYesPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF276749),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15), // Aumentar el alto del botón
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight
                                .w500), // Aumentar el tamaño de la letra
                      ),
                      child: const Text('Yes'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onNoPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF05959),
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15), // Aumentar el alto del botón
                        textStyle: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight
                                .w500), // Aumentar el tamaño de la letra
                      ),
                      child: const Text('No'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
