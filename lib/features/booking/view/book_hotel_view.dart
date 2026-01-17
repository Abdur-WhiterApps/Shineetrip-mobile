import 'package:flutter/material.dart';
import 'package:shineetrip_mobile/features/payment/view/payment_done_view.dart';
import '../../../core/widgets/coupon_card.dart';

class BookHotelView extends StatelessWidget {
  const BookHotelView({super.key});

  static const Color golden = Color(0xFFC9A24D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: _commonAppBar(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Book Hotel",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            const Text(
              "Your hotel reservation",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            const Text(
              "Hotel The Ventus Near Mall Road",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            const Text("22121 (Tuesday)", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 16),

            _timeline(),

            const SizedBox(height: 16),

            _infoRow(
              title: "Room No.",
              value: "3A - AVAILABLE-0048",
              trailing: const Text(
                "Updated few mins ago",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 8),
            _dropdownRow("Checkin Time - 11:55 AM"),

            const SizedBox(height: 16),

            _policy(
              "Get full ticket fare refund on Cancellation",
              "Just ₹4,275 per person",
            ),
            _policy(
              "Zero charges when the ticket is cancelled",
              "Between ₹1100 per person",
            ),
            _policy("Pay fees on cancellation", null, info: true),

            const SizedBox(height: 20),

            _section("Add Your Guest"),
            _addTravellerButton(),

            const SizedBox(height: 24),

            _section("Contact Information"),
            const Text(
              "(We'll send your ticket and status update here)",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 12),

            _labeledInput("Email", "Enter email id"),
            _labeledInput("Password", "Enter Password", obscure: true),

            const SizedBox(height: 16),

            _section("Add Travellers & Preferences"),
            _addTravellerButton(),

            const SizedBox(height: 24),

            Row(
              children: const [
                Icon(Icons.local_offer, size: 18),
                SizedBox(width: 6),
                Text(
                  "Coupons Code",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 12),

            const CouponCard(code: "MARTHABITSAL", amount: "662"),
            const CouponCard(code: "MARTHABITSAL", amount: "662"),
            const CouponCard(code: "MARTHABITSAL", amount: "662"),

            const SizedBox(height: 16),

            const Text(
              "Offers & Discounts",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),

            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "HAVE A COUPON CODE?",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 34,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: golden,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Apply",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Additional Preferences",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              "Your State",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            const Text(
              "Required for GST purpose on your tax invoice. You can edit this anytime later in your profile section",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),

            const SizedBox(height: 10),

            Container(
              height: 35,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: "Karnataka",
                  items: const [
                    DropdownMenuItem(
                      value: "Karnataka",
                      child: Text("Karnataka"),
                    ),
                  ],
                  onChanged: (_) {},
                ),
              ),
            ),

            Row(
              children: const [
                Checkbox(value: true, onChanged: null),
                Expanded(
                  child: Text(
                    "Confirm and Save Billing details to your profile.",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: golden),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 18, color: golden),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Please read health advisories by relevant authorities.",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        "KNOW MORE",
                        style: TextStyle(
                          fontSize: 11,
                          color: golden,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "By proceeding with the booking, I confirm that I have and I accept the Cancellation & Refund Policy, Privacy Policy, User Agreement and Terms of Services",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Fare Summary",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),

            _fareRow("Base Fare per adult", "₹662"),
            _fareRow("Reservation Charge", "₹40"),
            _fareRow("Superfast charge", "₹55"),
            _fareRow("Travel fare", "₹300"),

            const Divider(height: 24),

            _fareRow("Total Price per adult", "₹1100", bold: true),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: golden,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentDoneView()),
                  );
                },
                child: const Text(
                  "Confirm & Pay",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _commonAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: const Icon(Icons.menu, color: Colors.black),
    title: const Text("SHINEETRIP", style: TextStyle(color: Colors.black)),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 12),
        child: CircleAvatar(radius: 16),
      ),
    ],
  );

  Widget _timeline() => Row(
    children: [
      _timeBox("11:55PM, 12 Nov", "New Delhi"),
      Expanded(child: _dotLine()),
      _timeBox("11:55PM, 12 Nov", "New Delhi"),
    ],
  );

  Widget _dotLine() => Row(
    children: [
      _dot(),
      const Expanded(child: Divider()),
      _dot(),
    ],
  );

  Widget _dot() => Container(
    width: 6,
    height: 6,
    decoration: const BoxDecoration(color: golden, shape: BoxShape.circle),
  );

  Widget _timeBox(String t, String c) => Column(
    children: [
      Text(t, style: const TextStyle(fontWeight: FontWeight.w600)),
      Text(c, style: const TextStyle(fontSize: 12)),
    ],
  );

  Widget _infoRow({
    required String title,
    required String value,
    Widget? trailing,
  }) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title\n$value",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        if (trailing != null) trailing,
      ],
    ),
  );

  Widget _dropdownRow(String t) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(t), const Icon(Icons.keyboard_arrow_down)],
    ),
  );

  Widget _policy(String t, String? s, {bool info = false}) => ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Icon(
      info ? Icons.info_outline : Icons.check_circle_outline,
      color: Colors.blue,
    ),
    title: Text(t),
    subtitle: s != null ? Text(s, style: const TextStyle(fontSize: 12)) : null,
  );

  Widget _section(String t) =>
      Text(t, style: const TextStyle(fontWeight: FontWeight.w700));

  Widget _addTravellerButton() => Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      border: Border.all(color: golden),
      borderRadius: BorderRadius.circular(12),
    ),
    child: const Center(
      child: Text("Add Travellers Details", style: TextStyle(color: golden)),
    ),
  );

  Widget _labeledInput(String l, String h, {bool obscure = false}) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: h,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _fareRow(String l, String v, {bool bold = false}) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l),
        Text(
          v,
          style: TextStyle(
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
