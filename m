Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sqj1k-000150-0o
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:59:44 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 16 Jul 2012 03:48:24 -0700
Received: by qaeb19 with SMTP id b19so1396986qae.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 03:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=C4G+XI0z9L0JvD2YJSlyO75CULpp/O+TZ6Pg8WdJ0A4=;
	b=OYQuulZsfdLxjstpk7UPyd1AvNibOqyyJFnTp7aLO6pTg02QvXftixyX2mIjFK8KZe
	5rKRGJ/PjE1z2s5JjfjF9+XdnDMaXSJ5xxPumRDJvyxEliWyMR/x2nmW53pGfiSwBsyG
	A2l9IBd2VENNnOpnGX+Ol1hAlcroDuBsCoXLhZptP+Ip7FvyBgWQluV56H5CJBUkqbRr
	B88mKMYlAF/YuzWcubvjYX4D4tk5toFeiFc+2E9X3l1XHhC4CD/RLaKZPvl/UpuBTcGg
	6ccU8CIqFPCbfawVkQzvG/2YcSTBbR+m8+GmgGrvPfc2scBLnpyE7KCmq/vM83aQK4se
	NtqQ==
Received: by 10.229.136.17 with SMTP id p17mr5824203qct.86.1342435703976; Mon,
	16 Jul 2012 03:48:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.218.201 with HTTP; Mon, 16 Jul 2012 03:48:03 -0700 (PDT)
In-Reply-To: <1342435488.20265.182.camel@phil-desktop>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
	<8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
	<CAJTo0LY_S5JDsPtpcxr_nnQzZDWLv4RkndsuTEv8FWoBUygpiQ@mail.gmail.com>
	<1342435488.20265.182.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Jul 2012 11:48:03 +0100
Message-ID: <CAJTo0LZ-bPnoQpZ4qEmcMR6g2sYn1aU84X0OODodozDjk2y_6w@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
X-Gm-Message-State: ALoCoQnsj9vXZfxIft4VFsSBcf5YQxwItQs3cb7CS3jyrKVjfm+cWkhSQBgz2RVydBNJta07RntP
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] powertop: update to 2.0+git
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 10:59:44 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2012 11:44, Phil Blundell <philb@gnu.org> wrote:
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

I've now RTFM'd, thanks. :)

Ross


