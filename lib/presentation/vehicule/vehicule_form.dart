import 'package:buycar/presentation/vehicule/bloc/vehicule_bloc.dart';
import 'package:buycar/presentation/vehicule/bloc/vehicule_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiculeForm extends StatefulWidget {
  const VehiculeForm({super.key});

  @override
  State<VehiculeForm> createState() => _VehiculeFormState();
}

class _VehiculeFormState extends State<VehiculeForm> {
  bool isPreBidFee = false;
  bool isCleanTitle = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<VehiculeBloc>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: BlocBuilder<VehiculeBloc, VehiculeState>(
          builder: (context, state) {
            return Form(
              key: state.formKey,
              child: Column(
                children: [
                  _buildTextField('Cliente', state.clientController),
                  _buildTextField('Teléfono', state.telephoneController,
                      keyboardType: TextInputType.number, maxLength: 8),
                  _buildTextField('Marca, modelo y año', state.carController),
                  _buildTextField('Lote', state.lotController,
                      keyboardType: TextInputType.number, maxLength: 8),
                  _buildTextField('Puja de Carro', state.priceController,
                      keyboardType: TextInputType.number),
                  CheckboxListTile(
                    title: Text('Titulo Limpio'),
                    value: isCleanTitle,
                    onChanged: (bool? value) =>
                        setState(() => isCleanTitle = value!),
                  ),
                  CheckboxListTile(
                    title: Text('Compra Ya'),
                    value: isPreBidFee,
                    onChanged: (bool? value) =>
                        setState(() => isPreBidFee = value!),
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () => bloc.createQuotation(
                      isPreBidFee: isPreBidFee,
                      isCleanTitle: isCleanTitle,
                      //TODO Determine how can i implements discounts of secure payments
                      isSecurePayment: false,
                      context: context,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Center(
                          child:
                              Text('Cotizar', style: TextStyle(fontSize: 24))),
                    ),
                  ),
                ],
              ),
            );
          },
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
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
