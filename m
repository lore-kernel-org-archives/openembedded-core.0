Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T8Xb7-0006mH-Lo
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 16:25:53 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 03 Sep 2012 07:13:31 -0700
Received: by obblz20 with SMTP id lz20so9322364obb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 07:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=xNybXFN7YPIBMdUS05grQryOC0d8TVgP3VGS6CsXtPk=;
	b=IkTNX2C+3k/H67fgL64FtuzGJ+GEqYLa9qUYoR4F8KlVk+vtytHL03QOhXdJlB8Mk/
	Nl0jIQ3mE3EXtMMgA1w1JjIGZjg4q2U7M856AbLxUKf6CMKrg6sIgkUcdMqi3FRsTiBm
	Q6/wMGFOLJ8hZIpPsqQHb57ajTWYFVKtQ6K4VbMvkiGQTnuruOXrU5+qWW4JBrsZ6X35
	FXZqQAmCfeNVfcBz8JuWFNtsPB3yf12k2BeSwxINBdmFTNE7tXN4kKXoOE1hxGB3H8Fp
	3Nn1kZ2FCMDdBBavN//bsTMEBL2jRXizZu14pcNrSnQqg+YPO0+cmhfcP8PdpuHRa7A+
	5MbQ==
Received: by 10.182.108.71 with SMTP id hi7mr14426823obb.21.1346681610834;
	Mon, 03 Sep 2012 07:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 3 Sep 2012 07:13:10 -0700 (PDT)
In-Reply-To: <83D2678E-81E3-40A6-8766-53CD395C8205@dominion.thruhere.net>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1345653628.3907.124.camel@ted>
	<CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
	<8068324.QSSVEOGDPm@helios>
	<CAJTo0Lbn5ow1yMDj5X-c77CxNDNQJri4cWH_WdBEU3guWJdfrg@mail.gmail.com>
	<83D2678E-81E3-40A6-8766-53CD395C8205@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Sep 2012 15:13:10 +0100
Message-ID: <CAJTo0Lam8RbHZQ-BEUO+3CO3h=6nEBaV9Z_qS+YPtLQMiBX+WQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnME/2K3ZUYmTMBIKHwGJ97q0qZheVgXOiDsDuXJLaSkCqlywkxRHM7MTR74IP45Gs8fpQd
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Mon, 03 Sep 2012 14:25:53 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2012 15:05, Koen Kooi <koen@dominion.thruhere.net> wrote:
> And put it in meta-networking instead of oe-core :)

Yay another dumping around! It's so nice having multiple dumping
grounds to pick from.

Ross


