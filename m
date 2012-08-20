Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3Ozm-0003hg-0M
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 12:14:06 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 03:02:02 -0700
Received: by obceq6 with SMTP id eq6so8028791obc.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 03:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=fBZof7uNgHtEfe+1mw+M+B2I2qPlxPDf2bdhikPP5Io=;
	b=h82z5tKlfMAXcMUHVdbi+8RpYCzfSUPZzDnfcKEcdromH3O0RHdxQghoNDmnj80wKk
	FjleYRbqR0ACT11iFYlBbOXrRN5EhLI1Ult8W808D83vO6gTrhresXMEtsywjcD44HI/
	nRdRS+e3caLmMvni935LgLe3X5vFul2Ocn5CUwGD+QuV9gioVt/eqi4W1/loZx3Epb3M
	9n6s6Azgb9jW+uB0NBJ2HLYe6K8laEPHLdMCkNvhn7Z4vYhyj+SJ/ZsH4lzoiNNc4LtW
	qTyhWBwi8E3GwzJ9+xlmV+V0czZGh8DInuj3LUuCbny87iRsSPGFnmtbCYf4tjnphQey
	v1GA==
Received: by 10.182.108.71 with SMTP id hi7mr10319774obb.21.1345456921446;
	Mon, 20 Aug 2012 03:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Mon, 20 Aug 2012 03:01:41 -0700 (PDT)
In-Reply-To: <20120817121618.GH3625@jama.jama.net>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<20120817121618.GH3625@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Aug 2012 11:01:41 +0100
Message-ID: <CAJTo0LY717hPyoHqvW1nYuD2bgcRAG3JPVuYHUZy1gK1k+DZ1g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkx3Khzhao+cV2Zzt1AY1+TPRHFt2iJkMhqVXIwQaTjlN9irAYiZdx0mAyQS2kIskvHbj7c
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: One X Server To Rule Them All
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
X-List-Received-Date: Mon, 20 Aug 2012 10:14:06 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2012 13:16, Martin Jansa <martin.jansa@gmail.com> wrote:
> Is it? where? I've merged it to oe-core about year ago..

You're right, I saw xserver-common and somehow ignored the "common" bit.

Ross


