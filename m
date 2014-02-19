Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8A06EFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 17:20:40 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id j15so927829qaq.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9yyW7DEZX2pFcR/7MKwPTxbBMxr8KaEyZ6r9NnBVO90=;
	b=DM4gQ7eVF0QWBgU+QQUk58RALXYbujvhs7jzoiPElZD2wwA5l3Q9emdPmfOLpI2Rda
	3vrW9olA/g3c1mg4RVkUKLYokdy6Go+JGhFhzzELdlK3g0xaZyAiN7YIqHb3FDdAmUZC
	jwpHndNCMzfTd+9rRp/RJp+7CP4eCwBoBFp3XfWCiirW0Ud9Qvb4cp/Xho2H+yYjh3Fu
	3EcqT4LCoLzpESgjV0PntfsfEhFttE8NeH3gnJki2fkM/HK6hgIszHIIz0ogiqkyF0k4
	Ag9h/VyRVDjfwemkzJX/yHYNRWADrax/ayE5sa3/GxgUjq2WFnUwoWB3e5SUInzFxtC9
	zxQw==
X-Gm-Message-State: ALoCoQmJecselz06igB05EoXyfcMEE4gauG6DQqfjI9MqCZiul5QKS6UO2yVAUDFA5rdSa2lhkDe
X-Received: by 10.224.98.139 with SMTP id q11mr3502831qan.64.1392830440936;
	Wed, 19 Feb 2014 09:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 19 Feb 2014 09:20:20 -0800 (PST)
In-Reply-To: <1392829988-5737-1-git-send-email-valentin.popa@intel.com>
References: <1392829988-5737-1-git-send-email-valentin.popa@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Feb 2014 17:20:20 +0000
Message-ID: <CAJTo0LY1xJfs6tvzqOotiZ6XivVtAPt+Un+d_0cNiMnzzjfszw@mail.gmail.com>
To: Valentin Popa <valentin.popa@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: upgrade to 3.10.7
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
X-List-Received-Date: Wed, 19 Feb 2014 17:20:41 -0000
Content-Type: text/plain; charset=UTF-8

On 19 February 2014 17:13, Valentin Popa <valentin.popa@intel.com> wrote:
> +Upstream-status: pending

As there's an upstream bug and you've taken the patch from it, that
should be Upstream-Status: Submitted

Ross

