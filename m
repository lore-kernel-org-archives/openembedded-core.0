Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 70B0977182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 17:48:41 +0000 (UTC)
Received: by igvi2 with SMTP id i2so124212170igv.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=06jeTq7O1Pjob6PB9ZUgUb2qHJD2ZKwb4/B2/BlrW7M=;
	b=SOIsJijroqR10AH2eW/zeXO5V7gZJPlyC2ErGBEOyvSsttaYKm0md12a5khCd76P1S
	o0EhaIx+Kupapc/UTA2jdP6JdA+44U/KXGJaktAdcc3uE2UEkHdO/IFl99qYA+8zIvm/
	UPa1FEb766OJXFfPDIzpxmtkjUeVWydQ58xLrHXi8rB+GKlNTIKa2o0R3g/j0KkSKvqm
	cJCezBY4kn4xiao2OZyOLxc4F4GNSuaIIRt7i+80PJ1FzMFQpkjIN+e1uLQSyeuF0TBk
	NBp6IzLk9MeEd6q1/Li4/ANkCoMFkYY4nGhmRa77tIN4JH/+wisy+fmZ5T2BRNTQm4fm
	Dt4w==
X-Received: by 10.50.156.103 with SMTP id wd7mr9960301igb.75.1447264122228;
	Wed, 11 Nov 2015 09:48:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 09:48:12 -0800 (PST)
In-Reply-To: <4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
References: <1447240308-2849-1-git-send-email-ross.burton@intel.com>
	<1447240308-2849-2-git-send-email-ross.burton@intel.com>
	<4611513.VyrzVSX4hN@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 09:48:12 -0800
Message-ID: <CAMKF1soMHOgJ3bFSqQJkvQ29OJ9Q7Tty2gPOs-LymS3i0RiOZg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd: fix Upstream-Status tag
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
X-List-Received-Date: Wed, 11 Nov 2015 17:48:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 11, 2015 at 5:27 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> FWIW, I'd always thought "Rejected" would have been a more accurate label to
> use... on the other hand perhaps it's a bit late to be changing that now
> though.

for a non-native english speaker like me both just means same :) lets
stick to one and move on.

