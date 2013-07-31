Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id B424261883
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:56:36 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id ox1so776704veb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 06:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7vcfMXSg9GtkHzClTDw3SUkaFJLSdSMt9fGVSX+2YT0=;
	b=Jt1OZ/DLF9niI3Q3HUUnRoyUc4/BvWj7OyDd9dtQ89eWl8Pa5XYAXKEfws6NR944/1
	SBXQETFro2bobPTU26wZXa/y5lYl2im8os2182XJAEakta14mgH8YL5g4FHt0W8IvYnS
	uQvR7Ta1PWtNFXo6HRftQXOtvCthjM9VhdXWetVJGG1ZcUN6tbfgwMeFpH21Gn140xMq
	RUe8ewAToxRrRpM64rCuUpwskuZ7nJoZ00TpTgKv40F1ZvQYcQ4dhke151eodyTHoIqy
	GCweJu3cmcicBrxdM1aK6aEx1y9HXBqLhMMKNtTyWbuzKcjF3Y8ubw2Hkx0gJGErFims
	03Ew==
X-Received: by 10.58.233.8 with SMTP id ts8mr28447071vec.44.1375278997002;
	Wed, 31 Jul 2013 06:56:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 31 Jul 2013 06:56:16 -0700 (PDT)
In-Reply-To: <d5ae8d136ab3036e7f64600250abdfa099756076.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
	<d5ae8d136ab3036e7f64600250abdfa099756076.1375275560.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jul 2013 14:56:16 +0100
Message-ID: <CAJTo0LYbEC5aX4nesh=qvq=ONYo27GU1FjkPE2ksNYoPYOLdOA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkML+9adZ8vlSZz2pX5Z2SWVQ0e18fWBopI8nzd7/NL4yWdbExNWgFV8am/f29C8mKtx6XX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/13] flex: upgrade to 2.5.37
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
X-List-Received-Date: Wed, 31 Jul 2013 13:56:36 -0000
Content-Type: text/plain; charset=UTF-8

On 31 July 2013 14:09, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +PR = "r3"

You can remove this.

Ross

