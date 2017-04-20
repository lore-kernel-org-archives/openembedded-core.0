Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 233C2773B9;
	Thu, 20 Apr 2017 15:00:14 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j59so9858858uad.0;
	Thu, 20 Apr 2017 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p1kIFA3oK+uM5+9GQQ+PbLG3P0VzrgkpP+KtaHBhKXI=;
	b=aTWO/OVPrs/1AAApWPijPHsQecDRuT+7SSGao9nfS3PapelwLmohsX7zsPPCDWgBKT
	Rc2rhbh1XIMJ59XpKHUuGcqggcZ5IMea8OsaYpd9uNA/lsGWVp/GopO56iRoFJSYLbsu
	ZSaSt7i9xYxFoqi0wpHAe2XAdB5JJkKw8V+1/hwuOPSQmVBCk4FpfOr5sg1jBtK64z1m
	DGE7AGWrFtyShXGaAkH1c74JS9vqRtIg0e2Z3akXZcAzrLmAexcZ0zHEQcBr8/uA5x3w
	oxRaoveswNSatsg3MvxCzZ8C/XyX+qzqFvT0hxN45+ZSqURkkbm/wnsnJCAx5AbqToiy
	oPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p1kIFA3oK+uM5+9GQQ+PbLG3P0VzrgkpP+KtaHBhKXI=;
	b=gtiOI75SuoyBoir/n3EU9CGmEqtouom8WeGgOD9IcdC6oYPujhZJSa8msDe+3d3DZ9
	irmKuYN20b29UVpa9vJRrTumJduUhSgPuTVYQSTG9U3bpNFlF1TGJFFo/c0S+FpiOXxT
	9rZyhtU5Zz5QUyer4tU7WUR5Fjj09sChejwta0m4sdDy9ACqzBuYg9fLMaoR28uhdqaC
	lRzUCH6F1+SVq/vKaYP6Ml6Qe1PNnUdFqGKC+v/8btwhrh6sJ8eaFaSg0ioEy06kxoEw
	kMJSijplAPqRyocXQrKxPHSljfkim4I26zwgcsaMOv2dXFY6y7hPN2nm+vPqMGir2Ix+
	jrDA==
X-Gm-Message-State: AN3rC/4XnqZtPPJwR2DfOkbYj2z+3RZkRKvzLOaNyG/36x8U0CgC+OYd
	M0oqLF2bV3tvRfeiRKNNl02JcjOtgQ==
X-Received: by 10.31.171.88 with SMTP id u85mr3327346vke.22.1492700416013;
	Thu, 20 Apr 2017 08:00:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Thu, 20 Apr 2017 08:00:15 -0700 (PDT)
In-Reply-To: <51e8d1d4-d6cb-dcb0-32f0-42df0738ce70@mentor.com>
References: <527be78e-ad75-2221-06e8-18814bf55857@mentor.com>
	<51e8d1d4-d6cb-dcb0-32f0-42df0738ce70@mentor.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 20 Apr 2017 11:00:15 -0400
Message-ID: <CAHUNapRdwgYWF9yZmiLxPJg24C+R8vkii9v9oqoqVYVcWX6sLA@mail.gmail.com>
To: Sean Hudson <sean_hudson@mentor.com>
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded 2017 General Meeting
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
X-List-Received-Date: Thu, 20 Apr 2017 15:00:15 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 10:58 AM, Sean Hudson <sean_hudson@mentor.com> wrote:
> I found an updated list of access numbers that include several country
> specific toll-free numbers for the teleconference.  I've updated the
> wiki page with the details.  I also setup a #oe-meeting IRC channel that
> we can use as a back channel before and during the meeting.


Excellent! Thank you :-)

