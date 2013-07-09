Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id B4D386ABB0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:03:52 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id jw11so4694625veb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 08:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=jF6y6jGvsQ3W7VC6ElRw6riym8NUvXAY7V5GowLli/w=;
	b=RTzQd4S272yqjVXP6YNXnT0gkvK1RdCdB41+sUXLz25rRkvZDRfHvhor0FiiBFxfK0
	OAY2Wx+oFkpObdWpEfu4o4md2k59zfhLt0zVJnavpblfpW2JOIAb51EMuSNcqbEsPX3m
	tx3hC4Zo+UFFe9iPwCDbyAMXOpr2FmpOqDhP2dAigAZ1k248U5Pn6zRIHK8jXyrVJuBi
	JbgV488y7T16b5XTlyfm+yQplUbsLLIbSI79zfPjcCC66aVmgUUZKIWZQFGmFQAFKVpc
	yq0wmms6KScDFZfp/gks5DGeSbNwI92kpbcP7AV866NbWvRndH04dlT6LYeHrYbb0e8U
	OK9Q==
X-Received: by 10.220.192.4 with SMTP id do4mr16622556vcb.91.1373382233315;
	Tue, 09 Jul 2013 08:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 08:03:33 -0700 (PDT)
In-Reply-To: <cover.1373331522.git.sgw@linux.intel.com>
References: <cover.1373331522.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 16:03:33 +0100
Message-ID: <CAJTo0Lav17UPGp-t1f3D-5Q7KTgWqM98DZzXqSZucKr6UR4CQw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQn+m7W8/Thu0DLdqL2Khu3SYSl0GWDKOaTedHXn4vDAHK6zKS1AA2/b0hMrUFyrIiX8qH4N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/70] PENDING FINAL REVIEW
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
X-List-Received-Date: Tue, 09 Jul 2013 15:03:53 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 02:05, Saul Wold <sgw@linux.intel.com> wrote:
>   glib-2.0: inherit pythonnative

Remove, mail sent querying this.

>   resolvconf: check if running systemd in postinst

Remove, this bothers me, sending mail to discuss.

>   systemd: added python-systemd package generation.

Remove, mail sent.

Ross

