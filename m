Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 80E206077D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 15:00:44 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so5617070vbf.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 08:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=noH6uGFmRSy/2GX7KbeiUqdAHJ/DqDeZICWCu7UOSCA=;
	b=fnc2B4TCzDZ+K0Z41NGJg6BVlYl1cmJeURm7eDgJ9o9pDnpkcQnEtaSKBp6PeaCXnj
	q7XrTQzjH3VdX8MP/J7EikRl4+lN6ben16SYk3GcdHj8hu/61ibxbXkIHwxfz5X4rGSk
	qMHTpokPPXeagE0mYvvzH65NFp3yPhYfFh7Hu1RFhWim+dTXanVGMtkImzpJb1bls9A/
	mzx+WdOIWGVA06NGUK2tV/P47qFjr4XHgv2qfVosTUUb9EaF/14pAv6ShPjgMrHDeEI6
	gaP3tCg6oeVsAN2B6nAlPbQrkrCBSMlu2EiD2klnmiKnuhm6hcJNWaXu3QmTYR5vurJ0
	nXyA==
X-Received: by 10.220.45.132 with SMTP id e4mr11727589vcf.56.1374591644242;
	Tue, 23 Jul 2013 08:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 08:00:24 -0700 (PDT)
In-Reply-To: <20130605143619.GE20636@sestofb10.enea.se>
References: <20130605143619.GE20636@sestofb10.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 16:00:24 +0100
Message-ID: <CAJTo0LZNeJZO-=6YwnANqtNE3Q3t55+X49n0W_iJc2nUiG=cYQ@mail.gmail.com>
To: =?UTF-8?Q?Bj=C3=B6rn_Stenberg?= <bjst@enea.com>
X-Gm-Message-State: ALoCoQkd/fu5yX/nDu26xmtiMnGTbaphfumMFf5GNFOTCiybs0vWZuTxv0X5U++JunIH8PKeYwzR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: ptest recipes in progress
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
X-List-Received-Date: Tue, 23 Jul 2013 15:00:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On 5 June 2013 15:36, Bj=C3=B6rn Stenberg <bjst@enea.com> wrote:
> In the interest of avoiding duplication of work, here is a list of recipe=
s for which we (Enea)
> have already enabled ptest but have not yet submitted patches:

Do you plan on adding GStreamer to that list?

Ross

