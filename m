Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8756A489
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:05:40 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id wz12so411794pbc.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=2ruf7M7O6wXqoxt01bOH9m4a0IlWjnHm3HBcDlFyaV0=;
	b=C7w7/6FbAoabEKg+2QXPQBA/HosRwrnQ8f5dDt4Gy1ZTp/f7lxutfJsYBPrzaR4maE
	tddapaOSGeQTdNic+KluI6s8zXK0iHvXNFuNMVvhUXUsSAWMMvmv9LCn+IuURIhvImKm
	VIBWiHLldP1+q6bBVqOc70KPdTxjfg+murHfvyzAlNiaApu9tKK13C0W+TqxPLHZWlok
	SHSWT7fiPp2xESMkSDQazsITE4waBcfJV2lQmiDwrGCg4P0J3XSsyfqGw39ZLvXyQAr7
	VAAJgtjC5EaWxwVA4uKHY7GmVuzrj2oOv/gxjKJhRKdctHbYNz+EvMgMUAhmfEtX7S7L
	R2Og==
X-Received: by 10.68.162.163 with SMTP id yb3mr7930893pbb.212.1369922741362;
	Thu, 30 May 2013 07:05:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Thu, 30 May 2013 07:05:21 -0700 (PDT)
In-Reply-To: <20130530140207.GC24725@jama>
References: <cover.1369921759.git.ross.burton@intel.com>
	<22e0a87c5884adff2aa356bc6f02d9cb49ee2376.1369921759.git.ross.burton@intel.com>
	<20130530140207.GC24725@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 May 2013 15:05:21 +0100
Message-ID: <CAJTo0Lb8s7F1b-g2s7K0XobTcFfRWZiY8JzkAz6bMnfpqu3+Jg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmwnPhZYgk+IUL3omNPHKcgZknayF4NY8bfWxvL8UuezGdlfUd6Cz4yh2t6Ic13DmClpmwF
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/14] gdk-pixbuf: upgrade to 2.28.1
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
X-List-Received-Date: Thu, 30 May 2013 14:05:40 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2013 15:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>   ^ why not ${BP}?

Mainly because I keep on forgetting that $BP exists.

Ross

