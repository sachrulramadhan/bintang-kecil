import {createRoot} from 'react-dom/client';
import App from './App.tsx';
import {AdminApp} from './features/admin/AdminApp.tsx';
import './index.css';

const RootApp = window.location.pathname.startsWith('/admin') ? AdminApp : App;

createRoot(document.getElementById('root')!).render(<RootApp />);
