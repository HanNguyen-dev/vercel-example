FROM node:20-alpine AS base

# install dependencies
FROM base AS deps
RUN apk add --no-cache libc6-compat
RUN corepack enable
WORKDIR /app

COPY package.json .
COPY pnpm-lock.yaml .
RUN pnpm i --frozen-lockfile

# build
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN corepack enable && pnpm build

# runner
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next ./

USER nextjs
EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"
CMD [ "node", "server.js" ]