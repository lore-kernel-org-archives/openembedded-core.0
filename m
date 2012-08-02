Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Swz9J-00071v-5w
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:25:25 +0200
Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 10:13:44 -0700
Received: by ggnf1 with SMTP id f1so7938438ggn.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 10:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=PoCapVCpVFdLvp/Xg4x4+EvkBcKcJPprq2xgWjeZ5FA=;
	b=JV3iCI8MAR0aX9fyGPDrh5BwH8EHd539ALzfMVs300tc2wm5WxaETiKtKTiYfnKu8w
	Z2pZMZ8nQXb+SXdiSBNmH3BJeczyjs3NfH49vsEVhAa+2hjCC+p2VqwlISVUVEZhcPDg
	nuNDKSHozB8HLz+im2w7/BBLu41zfe/bpY1LL3kDBILEIycdthSANlqEbnzNsgpZC7lY
	ZzzfJxz633aD8We/xSaHCQx0tgKUpPC0kgq/BuFJzBK8vEbzLuKXsQxmpgd/pIq7KK+V
	ZOHF79MRbgg1PxtxbxaS+DRifJBuAYhrRB6F8Z03Xm4RJz4VdWnBLTLGXaRgWET4xNJX
	KsSw==
Received: by 10.43.92.71 with SMTP id bp7mr5036644icc.52.1343927623243; Thu,
	02 Aug 2012 10:13:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Thu, 2 Aug 2012 10:13:22 -0700 (PDT)
In-Reply-To: <20120802170401.GX16306@jama.jama.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<20120802170401.GX16306@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2012 18:13:22 +0100
Message-ID: <CAJTo0Lbxo98NnuaOUOXDt+xdbNprXxdDT73Pvm3OpdQP1Vdq0g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlkKwwu+P6W+WJ3/sXOYbQg6CxMBRfOed6VEdb3iLgfAM+LYLka1paizvoulNckgkjuPd8m
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Thu, 02 Aug 2012 17:25:25 -0000
Content-Type: text/plain; charset=UTF-8

Damnit, some PR bumps disappeared in the conflicting merges.  Pretend
they are all there and I'll fix the branch.

Ross


