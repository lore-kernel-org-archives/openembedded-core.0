Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TDzMn-0006Od-40
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:05:37 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 07:52:55 -0700
Received: by oagn9 with SMTP id n9so6246197oag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=i6iZ8xrwn4Kivj2EllforurIarkOnNAQNDSBYse2n9M=;
	b=Xdae+umR/vBg07wd82ApShQh0Zf/qh31YYgcsSJRit6wWX5FcM4Sm2cr0hzMBEILww
	BfZrJV2Wd/B49/8agslER6ywR4jc/rrtJosSt+upXiSNWr2xlR7jsQI4Mw4HeGWCHzP7
	gaiDcCXoflUqMv0IdFtaBFweGVUZ2CPCJ6/P9/oqozh9l6VRsHmMS27H0cea24wTr2vV
	qLYGULooY3BFzTOo4SfNffDC0GovEHc3O9wgXwU2AvTUTMAbo3J0rW7ESFzJRWbMEnM/
	1ONSB7RxdU3qlhSPeDkHku9S3PYjH5WBbIpRlUNB6Z/2+n70tBExqYNWb24WjDdkPrRJ
	qXBg==
Received: by 10.182.44.7 with SMTP id a7mr29890obm.80.1347979975060; Tue, 18
	Sep 2012 07:52:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 18 Sep 2012 07:52:33 -0700 (PDT)
In-Reply-To: <50588878.3060903@linux.intel.com>
References: <1347977074-3803-1-git-send-email-ross.burton@intel.com>
	<50588878.3060903@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Sep 2012 15:52:33 +0100
Message-ID: <CAJTo0LaPhD_5EHEG57D2GK-8SSgJ-vnYiaYbdrz1SmvoU8EXXA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlsWxBawbSEcmgTbxb8XKdCH6iIYVGSErSv+tk378Kgy8pIfuXoPuyzWOygwMRhwV9MRFUV
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] hob: Don't set busy cursor on the root window, just our window
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
X-List-Received-Date: Tue, 18 Sep 2012 15:05:37 -0000
Content-Type: text/plain; charset=UTF-8

On 18 September 2012 15:43, Saul Wold <sgw@linux.intel.com> wrote:
> bitbake-devel list might be a better place for this.

Erm, yeah, whoops.

Ross


