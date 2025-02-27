import 'package:buycar/presentation/vehicule/bloc/bloc/vehicule_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VehiculeForm extends StatefulWidget {
  const VehiculeForm({super.key});

  @override
  State<VehiculeForm> createState() => _VehiculeFormState();
}

class _VehiculeFormState extends State<VehiculeForm> {
  @override
  Widget build(BuildContext context) {
    final bloc = VehiculeBloc();
    bool isCleanTitle = false;
    bool isPreBidFee = false;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              _buildTextField('Cliente', bloc.clientController),
              _buildTextField('Teléfono', bloc.telephoneController,
                  keyboardType: TextInputType.number, maxLength: 8),
              _buildTextField('Marca, modelo y año', bloc.carController),
              _buildTextField('Lote', bloc.lotController,
                  keyboardType: TextInputType.number, maxLength: 8),
              _buildTextField('Puja de Carro', bloc.priceController,
                  keyboardType: TextInputType.number),
              CheckboxListTile(
                  title: Text('Titutlo Limpio'),
                  value: isCleanTitle,
                  onChanged: (bool? value) =>
                      setState(() => isCleanTitle = value!)),
              CheckboxListTile(
                  title: Text('Compra Ya'),
                  value: isPreBidFee,
                  onChanged: (bool? value) =>
                      setState(() => isPreBidFee = value ?? false)),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => bloc.createQuotation(
                  isPreBidFee: isPreBidFee,
                  isCleanTitle: isCleanTitle,
                  isSecurePayment: true,
                  context: context,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                      child: Text('Cotizar', style: TextStyle(fontSize: 24))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
  }) {
    final FocusNode focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(label: Text(label)),
        textCapitalization: TextCapitalization.words,
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => (value == null || value.isEmpty)
            ? 'Este campo no puede ir vacío'
            : null,
        inputFormatters: maxLength != null
            ? [LengthLimitingTextInputFormatter(maxLength)]
            : null,
      ),
    );
  }
}
