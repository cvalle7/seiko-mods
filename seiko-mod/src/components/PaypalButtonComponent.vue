<script setup>
import { ref, onMounted, defineProps, defineEmits } from 'vue';
import axios from 'axios';

const paypalContainer = ref(null);

const props = defineProps({
  amount: String,
});

const emit = defineEmits(["payment-success"]);

const BACK_URL = process.env.VUE_APP_BACKEND_URL;

// Función para crear una orden de pago en PayPal
const createOrder = async () => {
  try {
    const response = await axios.post(`${BACK_URL}/paypal`, {
      amount: props.amount, 
    });
    return response.data.id;
  } catch (error) {
    console.error('Error creando la orden:', error);
    return null;
  }
};

// Función para capturar el pago después de la aprobación
const captureOrder = async (orderId) => {
  try {
    const response = await axios.post(`${BACK_URL}/paypal/capture`, { orderId });
    return response.data;
  } catch (error) {
    console.error('Error capturando la orden:', error);
    return null;
  }
};

// Inicializar el botón de PayPal
const initPayPalButton = () => {
  window.paypal.Buttons({
    style: {
      layout: 'vertical',
      color: 'gold',
      shape: 'rect',
      label: 'paypal',
    },
    createOrder: async () => await createOrder(),
    onApprove: async (data, actions) => {
        console.log(actions)
      try {
        console.log("Pago aprobado:", data);
        const captureResponse = await captureOrder(data.orderID);
        if (captureResponse) {
          alert('Pago exitoso');
          emit('payment-success')
        } else {
          throw new Error("No se pudo capturar el pago.");
        }
      } catch (error) {
        console.error('Error en la aprobación del pago:', error);
        alert('Hubo un problema con tu pago. Inténtalo de nuevo.');
      }
    },
    onError: (err) => {
      console.error('Error en PayPal:', err);
      alert('Ocurrió un error con PayPal. Intenta nuevamente.');
    },
  }).render(paypalContainer.value);
};

// Cargar PayPal SDK si no está presente
onMounted(() => {
  if (!window.paypal) {
    const script = document.createElement('script');
    script.src = `https://www.paypal.com/sdk/js?client-id=${process.env.VUE_APP_PAYPAL_CLIENT_ID}&currency=EUR`;
    script.async = true;
    script.onload = () => initPayPalButton();
    document.body.appendChild(script);
  } else {
    initPayPalButton();
  }
});
</script>

<template>
  <div ref="paypalContainer"></div>
</template>
