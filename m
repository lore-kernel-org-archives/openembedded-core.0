Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tc0Gp-0002Uy-2X
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 21:54:44 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 23 Nov 2012 12:39:53 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so45912366oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 12:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=fzB76GRvzRhpjUgN8wT9o1zecf2T6qPuhPnhNRqA1dA=;
	b=IRHtmqa81FcZ77pbb8ou5VQTlrmbnUCOBv1q3CQ1dtkNeqX1kTpdFXuhw2j0XxjwyC
	JWAX+D39vcfQgPHkK57drJUh2Wb0c9zfycIhLLhbJzKxyvDq5z131fb64FMVnTDddgHn
	vUn2/0KZAl7IKaNYLPI/QesLx17od1+DKwxNo7mKxBXhYOdcpKU7q8bN4eLr4VMXEZoU
	9OFqXAPfSJDNZYLvHBtUevMj4bobXf5j6nCsENm5vDRUSQ5AnNsOHZ7PjHFRhuBzhR3z
	bHEs7XuHZLqGN54UHj6Ulm/Oye9vNMDl7+0ZXMBngGL5lDStsreAg3aP8GINMofh8Hpz
	JQ4A==
Received: by 10.60.22.161 with SMTP id e1mr3724842oef.93.1353703233001;
	Fri, 23 Nov 2012 12:40:33 -0800 (PST)
Received: by 10.60.22.161 with SMTP id e1mr3724838oef.93.1353703232851; Fri,
	23 Nov 2012 12:40:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 23 Nov 2012 12:40:11 -0800 (PST)
In-Reply-To: <1353656174-30164-1-git-send-email-cazfi74@gmail.com>
References: <1353656174-30164-1-git-send-email-cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Nov 2012 20:40:11 +0000
Message-ID: <CAJTo0LZX0YxwYbpopJaE3eHjF_dfyh_moVK_MauAo+8rp_r3Sw@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQnhkhtVNxfKBmw7yj4a8etAMtFchsOgrQ2HlS6jbbQHPYbT3+z2iaux6SZiL8dDO+lhW/11la04L8CJlIt7mWcK1KnZ+wu3BPCNZuMElbX6zp1Hie4naqu7usuBour6g0cx5RCtG4WtSxQCvSW9BnbIO7uhvPUccaIqZBmuKIirTMJce2uePSMvGcqUNWTZgvS+lUyI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: update to upstream version 2.24.13
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
X-List-Received-Date: Fri, 23 Nov 2012 20:54:44 -0000
Content-Type: text/plain; charset=UTF-8

On 23 November 2012 07:36, Marko Lindqvist <cazfi74@gmail.com> wrote:
> -PR = "r7"
> +PR = "r1"

r0, surely?

Ross


