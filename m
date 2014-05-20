Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (unknown [209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 193A865D0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 00:55:32 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so76127iec.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 17:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=FZxzsLbn+9y9lknZEnbTw1ngfYWarPrkUIVhqErgt7Y=;
	b=kYOlWouacemZforxtcyZkkicv1VDBhv4dEVpD5tfLUjlCUtg/2m9V54w9rltCltO3e
	/qzpXcilIiXaAFXUeDRv8dp7NTO/INRVZFgylAtkjPvq6eKX/1z4fPfV2EESqXPvpt56
	gL/pfDCbkseHRaZvMFfX/sgrU5YL1plngimrLmg1Hs+UFAZ566U8y6m/u4gAuQ7m1UFV
	ZA+BK089vC+w7jpKtlATmFOf/ohF2DqehMk2D7PNP8X6zBR6iHZN5KORnS6VO23pN/zc
	nO+fatc4OkZB3o4NLbNQKnAxOZ9f1WjeePznpB8o5thjdT1L2TLLOKUviTc3MsaSz9uE
	NUIg==
X-Received: by 10.50.78.201 with SMTP id d9mr415131igx.17.1400547333474; Mon,
	19 May 2014 17:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Mon, 19 May 2014 17:55:03 -0700 (PDT)
In-Reply-To: <537A41B2.9000406@windriver.com>
References: <cover.1400477731.git.Chong.Lu@windriver.com>
	<7a92a9da4b308473462f49d608a71cd1d014fbdb.1400477731.git.Chong.Lu@windriver.com>
	<CAMKF1sqhEE0HOqLZ9nQ=vUQQeCYw4eCxLTTG7-036vsmqS5TCA@mail.gmail.com>
	<537A41B2.9000406@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 May 2014 17:55:03 -0700
Message-ID: <CAMKF1sqhMrU5No4L+RWJioS1T=8EXX8KeFVhSzso0OzFB02eOw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libpcre: Update to 8.35 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 May 2014 00:55:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 19, 2014 at 10:38 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> I just checked, and the only diff I can see is copyright 'years' were
> updated to include 2014.

OK may be amend the commit to reflect it

