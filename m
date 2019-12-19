Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id A85317FE10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 10:03:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z3so5348447wru.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 02:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Zv8DPx/unCEcz392ufbg4yN2zn3e84tsOvgmZGU3Oec=;
	b=XBS9P2NP3SzZ6xbPyokJSxLEKhsRUYrKUWn/eDYgOa2cS3vxaYQpyqOFPIIhan8ETt
	TEr1eGjCld9zn0EeIKmDxr669R0B37WCQMdCjJ5IfonwInv/eFYx/7MAQ14d/kk/zCDf
	QJh/HTp0ZkOx/Ip/Jgvbm/jmU000pADSEzJeSuf/7B8CQDTBu72EWaFxYlMqYzGr5zXj
	9sW+Ho8kpOz92xqcAh4KK0rfne8Yo2mWnkaEP4smO7pxvHpfU2l9vjbJER20kHQ7zmaf
	xrpfJmyYFpQbuMJNMxDqkjzRnVrkieOqfnYZZBNFfEfyooPe2U6+K3hzH/VstkdvR65b
	IRIQ==
X-Gm-Message-State: APjAAAX8xExFe3iK3mpCLE4iXHwASgSe/D/3tthQetOgbRJWFjqf+KWQ
	RHEkPhc3MDRVqyMJh85/4AU=
X-Google-Smtp-Source: APXvYqys1QY4+yMFe48bw9XOlEqZ2rZVbXADbfRcCvIKrPGUn1ahfSwIctpP5/qMavcT/EiJOW0Irw==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr8360063wrp.1.1576749802295;
	Thu, 19 Dec 2019 02:03:22 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x14sm5506489wmj.42.2019.12.19.02.03.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 02:03:21 -0800 (PST)
Message-ID: <aca7f186a9f24fa67be74290b35e9d7fd3b67add.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Date: Thu, 19 Dec 2019 10:03:20 +0000
In-Reply-To: <111284538.1355376.1576494949313.JavaMail.zimbra@savoirfairelinux.com>
References: <1494667065.1274125.1576154956651.JavaMail.zimbra@savoirfairelinux.com>
	<03cc8dbc90e39b92e48384b060f936a74a2faf26.camel@andred.net>
	<111284538.1355376.1576494949313.JavaMail.zimbra@savoirfairelinux.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Savoir-faire Linux Rennes <rennes@savoirfairelinux.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of the NPM refactoring
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
X-List-Received-Date: Thu, 19 Dec 2019 10:03:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Jean-Marie,

On Mon, 2019-12-16 at 06:15 -0500, Jean-Marie LEMETAYER wrote:
> Hi Andre,
> 
> On Dec 12, 2019, at 9:17 PM, André Draszik git@andred.net wrote:
> > Hi,
> > 
> > On Thu, 2019-12-12 at 07:49 -0500, Jean-Marie LEMETAYER wrote:
> > > Hi folks,
> > > 
> > > I am currently trying to update/refactor the handling of the NPM packages.
> > > [...]
> > > Is it OK ? Any thought ? Any advice ?
> > 
> > Three questions occurred to me on that whole subject... Mostly based on the
> > 
> [...]

Thanks for taking the time to answer my questions - sounds fantastic.

I'll give it a try sometime soon.


Cheers,
Andre'



