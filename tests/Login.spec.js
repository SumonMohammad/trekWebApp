import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('https://app-dev.techetronventures.com/login');
  await page.getByRole('button', { name: 'Log in' }).click();
  await page.getByPlaceholder('1XXXXXXXX').click();
  await page.getByPlaceholder('1XXXXXXXX').fill('1999999999');
  await page.getByPlaceholder('password').click();
  await page.getByPlaceholder('password').fill('0000');
  await page.getByRole('button', { name: 'Get Code' }).click();
  await page.getByRole('spinbutton').first().click();
  await page.getByRole('spinbutton').nth(1).fill('0');
  await page.getByRole('spinbutton').nth(2).fill('0');
  await page.getByRole('spinbutton').nth(3).fill('0');
 
});