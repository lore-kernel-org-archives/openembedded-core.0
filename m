Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <21f843796eca491459e547207dca11711045ceb5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Added quotes around variables to prevent word splitting in the oe-init-build-env/oe-setup-builddir shell scripts.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 06 Apr 2022 09:23:06 +0100
In-Reply-To: <6568.1649230660343372584@lists.openembedded.org>
References: 
	<7d146babd0bd0ac532c645eed0c14faacb0a44a5.camel@linuxfoundation.org>
	 <6568.1649230660343372584@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Abongwa Amahnui Bonalais <abongwabonalais@gmail.com>, openembedded-core@lists.openembedded.org

On Wed, 2022-04-06 at 00:37 -0700, Abongwa Amahnui Bonalais wrote:
> Hi Richard 
> I presume it is a good change since the user will know what is wrong and be
> able to fix it.

Yes, I did merge it to master with a small fix to the subject line to clarify
where the patch was being applied to.

Cheers,

Richard

