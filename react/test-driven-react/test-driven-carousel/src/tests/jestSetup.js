import Adapter from 'enzyme-adapter-react-16';
import { configure } from 'enzyme';
import 'jest-styled-components';

configure({ adapter: new Adapter() });
