Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UV0zE-0002vr-Bd
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 16:47:59 +0200
Received: by mail-ve0-f172.google.com with SMTP id db10so755890veb.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 07:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=eEPiz7PMB6jxZ60jEnfxbI2NVHMWIrtEYoWrdQrDRZI=;
	b=O7wzlfsIHcXMBv5Y4yWH0cp/Xi/VEYKhDPA26Av9LNAqNx0c/TfVfSgFwQWsUvPeuX
	DxqSzGfbxkQbC9WlxcFOP/od+UUtARRTGgRB1SpHhwFKpQd9QBtiFCTxqlxhlILnVNVJ
	0qM0Vzbsn5u1V5KbjKd7N8nbCXO6/7nImnJ9pi14Gz60zi54GPf4uLh3SX43Bys0d6wN
	8w4TTIqu2m9qLnKYqKAw2y12dG/8LLWYCcqOUJctiGWX095dPnupPSs92UkXaSoC2yt3
	8Ura0o/QreFVZS/3NRI1W1KRYmkDxxFnYpDo6ivKdE73YhWdRvT6EMMZDXLICuUvYNw9
	mJPA==
X-Received: by 10.52.174.41 with SMTP id bp9mr9144599vdc.4.1366813814087; Wed,
	24 Apr 2013 07:30:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 24 Apr 2013 07:29:53 -0700 (PDT)
In-Reply-To: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
References: <1366813574-21199-1-git-send-email-ml@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 15:29:53 +0100
Message-ID: <CAJTo0LbLaycJ1YNRynLSGPpaMWunj3e=RZFn0ENVGVqd-djJ1A@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
X-Gm-Message-State: ALoCoQneWvvkN20f4OYKWL6n8r8EZLauZ9Kwaxlb5H9Ko1ILIO3fcms5/89Eq4d3rcm3SQEjI3Sq
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: update to 1.13
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
X-List-Received-Date: Wed, 24 Apr 2013 14:48:09 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2013 15:26, Jack Mitchell <ml@communistcode.co.uk> wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>
> - Removed upstream commited patch
> - Updated git tag srcrev

Under what environments was this tested?

Cheers,
Ross


