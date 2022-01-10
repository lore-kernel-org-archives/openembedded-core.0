X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <fd442dd3-bcfc-c72f-07ee-d85be5c8c22e@axis.com>
Date: Mon, 10 Jan 2022 08:38:22 +0100
MIME-Version: 1.0
Subject: Re: [OE-Core][PATCH v2] gstreamer1.0-plugins-bad: Add support for mpegtsmux
References: <20220103083850.385326-1-joakim.roubert@axis.com>
 <CANPvuRmoXvv4yYDqfeDyXYxbYSDrGxF-FRyX2UibBTtP-XMYwQ@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
In-Reply-To: <CANPvuRmoXvv4yYDqfeDyXYxbYSDrGxF-FRyX2UibBTtP-XMYwQ@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On 2022-01-03 16:32, Jose Quaresma wrote:
> mpegtsmux doesn't have any external dependencies and is not present 
> in EXTRA_OEMESON so it is always enabled.
> with this patch the default config will build it with -Dmpegtsmux=disabled

I can see that now, having had it explained to me. Thank you, then my 
submission should of course be void and ignored.

BR,

/Joakim
