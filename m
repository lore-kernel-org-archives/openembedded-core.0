Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tcwb5-0001E6-K4
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:11:32 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 02:57:18 -0800
Received: by mail-ob0-f197.google.com with SMTP id za17so43269594obc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 02:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=zo4k3npJZTXy/ailIj6gvJV3r7rLZhEb8POm6c4uFc0=;
	b=IlTdop0H8Sj+JGefYwpcbYnrlDPEgAb2GHCQ6P4PxYtvcXe8eyTV8zvo+WQ+uRbtSZ
	vuGhjne3d1/g9wVKaScQXrSN9UjqJZ6ly/7/ekxVuhMqjf8ngEiZav15us0NRf7VKfWo
	f413mlV2w1OBqJrny1RfXiTP/JKeDFgGAwwie0APH/DpZWUp6kdjicDvYX4eomeT6L00
	fBn5qgUEY6Mr7XlLUj/geMeUgeg5ZwGH00S4MGWFC2MhKrtaLLWC8+AMEdtWpptCiyIC
	LYDLYL3hl6BQACpzeyawKsbgTogphaNoPTHxid1EZXQ3Y9vHcJ0P32ANkj/NxF1njrMp
	2rOw==
Received: by 10.60.12.99 with SMTP id x3mr5528283oeb.71.1353927437310;
	Mon, 26 Nov 2012 02:57:17 -0800 (PST)
Received: by 10.60.12.99 with SMTP id x3mr5528280oeb.71.1353927437246; Mon, 26
	Nov 2012 02:57:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 26 Nov 2012 02:56:57 -0800 (PST)
In-Reply-To: <c355ac9e108b74b1d4e970f8e0f32c33d1dd4366.1353582422.git.Qi.Chen@windriver.com>
References: <cover.1353582422.git.Qi.Chen@windriver.com>
	<c355ac9e108b74b1d4e970f8e0f32c33d1dd4366.1353582422.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Nov 2012 10:56:57 +0000
Message-ID: <CAJTo0LbwopMuuPzBnav27ELgpizOkZrBrBoW=cdoqg_MRfqOhA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQmt0+ggvh7672CEJ9RxR9FYswzPtZUFo8eYkkNZXk8hxqlLMTWtSH5hc16EenZq8YRwXyE4m3conAYdn3ekzNmHbR9opKR2hC20xjbH0mL0DoJTZCxvbvc+bxWwQo8xzBwZWB3Llu8fqhhUQQyf2xTy/Rr6FngSwx1hnfIOrP/cQ9KUTmciru8sp9FOxisUnrR2c4u8
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] icu: add pkgconfig support
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
X-List-Received-Date: Mon, 26 Nov 2012 11:11:36 -0000
Content-Type: text/plain; charset=UTF-8

On 26 November 2012 09:36,  <Qi.Chen@windriver.com> wrote:
> +Upstream-Status: Inappropriate [distribution]

Surely this (and all others) should be submitted upstream.

Ross


