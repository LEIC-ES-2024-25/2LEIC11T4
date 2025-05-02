


Padding(
padding: const EdgeInsets.symmetric(vertical: 10),
child: DropdownButtonFormField<String>(
value: selectedValue,
decoration: InputDecoration(
labelText: label,
border: const OutlineInputBorder(),
),
items: items.map((item) {
return DropdownMenuItem<String>(
value: item,
child: Text(item),
);
}).toList(),
onChanged: onChanged,
validator: (value) => value == null ? 'Please select $label' : null,
),