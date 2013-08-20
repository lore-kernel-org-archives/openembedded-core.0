Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id D7CC761883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:06:20 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id w16so148447vbf.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 04:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r2yPIKJfar7hCCYAckK5bokWazHLhxogO22c7R4ELmI=;
	b=Z3jvwY9oQi+X9hOLP+u/cWr4JCAXkNtdPXxgtT/NHXHcVGSWpiEAavzcgkseIJ6Wtk
	Y5fnUgX1brV/rpSU6rWT+rYijT1fo/hpOTB0pPP6+5IlEsJnp6FvmPjeQUgBt72yvVnE
	zoRxNFqOKsYR2M1wxh+Wpdu4u9JEoklZySI0NzH6hQT7UlyXrG4XCBhRWGAB1CiUa3Z2
	tBmMwjjHtw4Dz7YevYtUe+sUEZuQTVggxAtOBgNo7CdCxEQeCAMH/ozR2frPa+lgsY04
	9OuccLr9rbQ/2jxel34z3LxBn1pdY2Ry4OyeAg3zDgXrHG6U4ZvucCkAQTWu7CqW3jdB
	BEbA==
X-Gm-Message-State: ALoCoQlsc9bCczZVoiJy9GCcbbp7JLxgubpOADTq62Y8h/YB9zZrXWGa1p3HLurx3GuscF10PLB+
X-Received: by 10.58.100.234 with SMTP id fb10mr723576veb.5.1376996781152;
	Tue, 20 Aug 2013 04:06:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 04:06:01 -0700 (PDT)
In-Reply-To: <cover.1376988152.git.cazfi74@gmail.com>
References: <cover.1376988152.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 12:06:01 +0100
Message-ID: <CAJTo0LbUg8e_pQ+zFHa2bGjChUQpWhmiSqEfwq+KneG7KtmP-g@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Automake-1.13 fixes
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
X-List-Received-Date: Tue, 20 Aug 2013 11:06:21 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2013 09:44, Marko Lindqvist <cazfi74@gmail.com> wrote:
>
> The following changes since commit fd9e591f266e1a6c183e77f24e50d31e0d52bdd5:
>
>   cronie: fix out of tree build (2013-08-19 11:24:51 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib cazfi/am13
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=cazfi/am13

Are you deliberately just sending the cover letter, or is my mailer
being strange?

Ross

