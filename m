Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tcz6q-0005z2-5c
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 14:52:29 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 05:38:14 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so53764122oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 05:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kyZlf+fGJL3GqGnUPMt7I3hfUI5k9nmfBU4dMnnWO/w=;
	b=BqEbFnqagR08hIQ0F6Ui9tCr+lkkHnvfekHnotVNMut4rbPQR4IzmbXmllXCAnUXdC
	4kDTVc3sk2v5w0qacr85clqBNiqRvUdxOEryHo/Cm477irAwkDMeKJg1bP4mcIPXGD2E
	ksZ0aFUEFfDkQtaYK+13/y8eET5Va4reXUzeEZ8pkXg4VBahVE/uEVLz+004U8IwUZxa
	ndlNNvuIOmoezGTsNnJBFI32lVAaQNsXLXu3VKl6CAm+u504g7bFgaMtEyii0jiN+L+C
	ifu/MEoG1U7ql9RBrsnprmz4N8992a0fVeP19JuDUuSyzZDtbXxqAWcvQglCFF4RK6Ag
	sJsQ==
Received: by 10.60.25.132 with SMTP id c4mr9186498oeg.63.1353937093731;
	Mon, 26 Nov 2012 05:38:13 -0800 (PST)
Received: by 10.60.25.132 with SMTP id c4mr9186485oeg.63.1353937093628; Mon,
	26 Nov 2012 05:38:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Mon, 26 Nov 2012 05:37:52 -0800 (PST)
In-Reply-To: <cover.1352826909.git.tom.zanussi@intel.com>
References: <cover.1352826909.git.tom.zanussi@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Nov 2012 13:37:52 +0000
Message-ID: <CAJTo0LaLdOO1K81CU6A_uTerWrzvi9RvcN0ZGD+ZgtMPcG_naA@mail.gmail.com>
To: tom.zanussi@intel.com
X-Gm-Message-State: ALoCoQlWIxHsbeA5Cv+kCPlErKzpH7qXmbwxEcaXyEj4ayX4SsPCozV3fUtZ2ZHBKOsCDw49oz56lxyQv1PzFppPPEQ8oZAEHmT6y1Lyzd89xmABq0CJtHiIbHCe1JUV6pd8FFxF+ulldAuBdv9M3HihlffwxnX1bX6MXTFsG4ZLFFHCk4rnrJ9HV3MGZbH6AHnjtF0l75rJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] lttng updates for danny-next
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
X-List-Received-Date: Mon, 26 Nov 2012 13:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On 13 November 2012 17:26,  <tom.zanussi@intel.com> wrote:
> These are the lttng fixes that didn't get pulled into danny (but
> are now in master), so I'm resubmitting them for danny-next.
>
> Tested on crownbay.
>
> Please pull into danny-next.

Merged locally to danny-next.

Ross


