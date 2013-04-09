Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPcZt-0005Tg-NV
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:43:31 +0200
Received: by mail-we0-f170.google.com with SMTP id z2so5690427wey.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7zdY/0A0C605laMrWJ4/5vgMaLgrhX+nJTGsh7U6EBw=;
	b=hfPb+f5MNVNFhJkshgBaR2PXKQQ2Jxy2aAQb6llOpfQ0Dkhr+DnmEY+XNirN5r0bcH
	iFO3wbcmUDpQD+oBLedaYmb5+rD1o92mXx/rBqiBOu+FCVK+9vxtVr+q+zgZ/et9u9q1
	SjGUGYlXfF2NnAaRu446LTadh47cAcxXfXuunejcPgfd72xUlAixo9wbcQrYRzx8ooRN
	chPMTc9WDdyfWW6ZoGisc0IO93Arb5Pzyr8HDHSzQ/u7uyGKV9KG4IfhVWDtVXiQ8Nyh
	wtqAJYRjHD5dGwLXgpPMRty9xjFzFvyBS+hRH0AgDMjfxUkpZR1H5mwO1dqfJAjBKnsQ
	pwOQ==
MIME-Version: 1.0
X-Received: by 10.194.157.42 with SMTP id wj10mr40457423wjb.12.1365528369399; 
	Tue, 09 Apr 2013 10:26:09 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 10:26:09 -0700 (PDT)
In-Reply-To: <e2901c2ad30a411fb90c6b5eaca242563257085c.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
	<e2901c2ad30a411fb90c6b5eaca242563257085c.1365517068.git.paul.eggleton@linux.intel.com>
Date: Tue, 9 Apr 2013 13:26:09 -0400
Message-ID: <CAHUNapQnYrWDDnoj8RGgb-f4oUE8xaArtPDYhLvCoV8fHsZ8OQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] meta-*/conf/layer.conf: tweak BBFILES comment
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
X-List-Received-Date: Tue, 09 Apr 2013 17:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 10:19 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> -# We have a packages directory, add to BBFILES
> +# We have recipes-* directories, add to BBFILES
[etc]

Thank you :-)


