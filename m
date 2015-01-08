Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2EC6B7169F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 17:30:00 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i8so3227116qcq.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ODezWVBRMhIsGfe3fiwAcU0THeBeNBoT/XsG+HSyfmU=;
	b=OXGyi2e+dZD0A0L8kIJ5e5TkSDHxn5YJZlfRAF4hJ46CdrNujwvYZq6l2Rt4SmepeA
	5OJGh65Nb/kgC2lG1l5WHhzxZAFV25tiOlwcgRjA4Lk9iK4WA1VFKpcvdWqiPyNu4ujq
	uGwTD0/c7LenoSYXPJFLo1/7Sb4IHgARv6/ydzyLGO4TSC0CuG2oXBchTvNauD1qsazk
	V6Llx1wAkvsDZQ/1G/XWUKhhqx+eIsQdUhQIWLhcoX5TL8iM+ZtVAEgNwdCy3Isp2ppl
	n5TnZ+mqXRE5MEfcUHkpOdbVzXMpRHIqCj1igG5Yrs1gYlKknUDB37Y2HphcIxKnvLN+
	PYxw==
X-Received: by 10.224.57.142 with SMTP id c14mr17582932qah.103.1420738199792; 
	Thu, 08 Jan 2015 09:29:59 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:10d:1c10:bb0:ae2b?
	([2601:9:3580:84c:10d:1c10:bb0:ae2b])
	by mx.google.com with ESMTPSA id r16sm4562546qay.10.2015.01.08.09.29.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Jan 2015 09:29:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4MVZir6UMdfAoABSh5TgmiMLa3sQMKE3YRiWefQuQh7UA@mail.gmail.com>
Date: Thu, 8 Jan 2015 09:29:56 -0800
Message-Id: <DBD151E6-CA6E-4561-B77C-14911D9DE15F@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
	<1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
	<56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
	<A4B52F1A-F782-4EE0-B4E3-8E007AC38BCE@gmail.com>
	<CADkTA4MVZir6UMdfAoABSh5TgmiMLa3sQMKE3YRiWefQuQh7UA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1993)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, yocto <yocto@yoctoproject.org>
Subject: Re: Bug reporting and good bug reports
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
X-List-Received-Date: Thu, 08 Jan 2015 17:30:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jan 8, 2015, at 8:59 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
> Assigning and scoping the actual work doesn't scale based on email =
threads
> (as someone who has been thrashing to keep information straight, and =
reproduce
> issues .. I feel this pain greatly).

if you are a talking about corp development yes I agree for open source =
projects
thats the nature of the beast.=

