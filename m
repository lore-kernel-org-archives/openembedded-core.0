Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tcz2f-0005rf-0Q
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 14:48:09 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 05:33:52 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so11556986iec.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 05:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=RMFiuVRG/kfmh6Z2UgCs+q5j9iAcjeaOOAXlkpbWueQ=;
	b=lKHY92CGRbA7X7VeUDEdTVEwyLYCsOG9dNE9lYJAJ00f6CXsnhKPGvqjug2LmBiGvP
	VD1RTeNsLJaaMXHH4Wpt+u3Je9lG4yCBSzTN9/x7m5D/+fVzBIt3GBl392EaKW1Ws35Y
	cbtBrXovWwqOs7H0jvYNabonj3UAeEXwtBYTzvJLQsD5xAnPxlFGVsHzhuY48FtItIHB
	PIZORMESEwkCCF6N5yttC3Sv8olDGIa5oGswJzaHt9YATBFWHeUDR7mfzxhbu4JWnrHP
	8MfMbBg4ipO+0Qke/W5GB80SB76kiDZR+x2u20f+t+26VCwJZHXpAxUUu7U81UveZas6
	HW5Q==
Received: by 10.60.1.169 with SMTP id 9mr3719448oen.93.1353936831931;
	Mon, 26 Nov 2012 05:33:51 -0800 (PST)
Received: by 10.60.1.169 with SMTP id 9mr3719446oen.93.1353936831861; Mon, 26
	Nov 2012 05:33:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 26 Nov 2012 05:33:31 -0800 (PST)
In-Reply-To: <20121126143123.564e8f45@eb-e6520>
References: <1353334373-16509-1-git-send-email-eric@eukrea.com>
	<20121122111552.77470adb@eb-e6520> <20121126085909.64b59d37@eb-e6520>
	<CAJTo0La0t4t+tArOcCQodE-LLDFuOr8O_vdS1iveij6P70_6LQ@mail.gmail.com>
	<20121126143123.564e8f45@eb-e6520>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Nov 2012 13:33:31 +0000
Message-ID: <CAJTo0Lb=cz69FeOhS98VHDFh64hEft0YGO=hgLPVQD20UH1xRA@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQkdctIEGrj5sIjXFOa719ce+OtpzAZAe1Hoe3ugxhLsCcF6b9IOxyb6D2GfuR/4lDSGkxjnNuZ6Lq+Rx6uUMlu+QYThYqfzeD1s1ycoXKnEcymxRQK04AaaNkqgx3P50R2EGORytfKRCeHOGT8VMliTyD4LIhs2/xIbcwpo+oFzd+6k3siSBkmxAEC9dLrYjCy2I13Y
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod: fix git repo URL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 13:48:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26 November 2012 13:31, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> thanks, so you are the maintainer of danny-next ?

Indeed I am.

Ross


