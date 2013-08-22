Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 792C26AF21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 18:25:56 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id id13so1263523vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=56rIkiBfUCBYfN8C32peZ3KOJID4ctTdVoMh5bpdf1g=;
	b=gpAK0J6b2QZwtM61ayv5opNj33dRh0NuJemrYNTIDFoBxTcGFqwi72dtzBKhD2IAbQ
	ku8V9b9j7MjDuc8HamGShOdDJhxx0SKRFK0wkXqoTfrPcS4SuYl+9726xldBevbx4EbZ
	FM5mJLcbotwNUYqoyV6/RKzau2Xr26Kbw+730BZx8qWSP2Qb5AagrWBk2/N+rMzwYMCy
	CFRTZNnUA4rm9EXwNkhv0t3st67/2uUP9vXqSY/2Qu3r+XzPC886y4UKJKigHXipmPEP
	pNwuGJx/T4+tjvJNXVJt59T1D8cyeu54AQIGPuVKN0YRWHAeUiH0nJ/s1BTKqoXXvvdW
	8GgQ==
X-Gm-Message-State: ALoCoQnCSCR+vW87T7kAlkBbQY7b+QtD8XrlX6cfqqzjiyaMRkm0NfvjB66pcOvpocIf9vcFwc59
X-Received: by 10.220.169.203 with SMTP id a11mr2060420vcz.26.1377195956825;
	Thu, 22 Aug 2013 11:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 11:25:36 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C1928F@IRSMSX105.ger.corp.intel.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<CAJTo0LYJhy5Qxn2Mbom5vgyiM_d_H+TvU0mCyUHp01ZVoeYvMQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C1928F@IRSMSX105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 19:25:36 +0100
Message-ID: <CAJTo0Lbs0r-unjpfiGFk7GxZRkE8feT1xNBQvTrY3L_5G+Raaw@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 18:25:56 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2013 18:32, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> So your advice is to keep hicolor-icon-theme and also add sato theme?

Yes.

Ross

