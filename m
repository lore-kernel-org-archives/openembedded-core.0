Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B22E619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 15:16:04 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so9798270veb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 08:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LNfMjB/h2i1kkydOKX/2t325ZW++MPwzhSyTYLkzvRY=;
	b=Yxb3CSTKjJnW6ONdXPz3vvaAc8V+41Zf4htlu1i83XCZHsbmUxh5rIM3TmlCDPJHQN
	0TDREbEDnxPWRCobybIAZIUdBufVVap8oMEoS1BtwkN3XUyUVraxb74RCHaDc3eowd7+
	ItK3SKqIcYckT+FcdZ0EKJredltdyganWmHBpQPtopi56LkPaQNQuwI6YIItJBbNAog1
	f4Fg0HLb38H7uVS7ge2TBI9qTxw4/zMynwHCz1b8v1aVkNQdFwMzHfIQnkMdJjzBc26s
	N1xSGgIEersqeCoqoBOmtJtvpmLKstb+KpppyHYWYJbHU7qZYDVY+PRYK1Pi+7PAJfVP
	2XJA==
X-Received: by 10.52.18.196 with SMTP id y4mr16352375vdd.51.1373901364901;
	Mon, 15 Jul 2013 08:16:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 15 Jul 2013 08:15:44 -0700 (PDT)
In-Reply-To: <cover.1373900913.git.sgw@linux.intel.com>
References: <cover.1373900913.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 16:15:44 +0100
Message-ID: <CAJTo0LZiWB4Yx5sRMPkRv5jWgmGdUDmT23wO1ax4=o4NZ4SNBg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmj7J1iDj63MUxuvyZSneJkj9bCFKUKswsmLXe7kqfyEY5BPhA5PusAO7kV/H1Ggb7NSCY9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/15] Ready to Pull
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
X-List-Received-Date: Mon, 15 Jul 2013 15:16:04 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 16:12, Saul Wold <sgw@linux.intel.com> wrote:
> The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:
>
>   distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Acked-By: Ross Burton <ross.burton@intel.com>

Ross

