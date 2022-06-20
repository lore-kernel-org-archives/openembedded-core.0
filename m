Return-Path: <qorin.wu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7F4C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 08:08:06 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web12.27633.1655712480084760403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lapt59Y9;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: qorin.wu@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id i15so12740665ybp.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1d4qcu7NZ7qgtgSI5XVhkuIhOwd763XYvi6GD6j9+gA=;
        b=lapt59Y9k2oFgbOYm48qWIb+kd0daZVbTe60flO5JFYvXZJ+VpZB+/Z0Eh+QtbOXTd
         ZypPLAs+mV7ZD9DnU5QCFtTaWuYG6J6uIKLWqGsQr9u3sKvhDGMEuttNFRCG+bPTARsS
         kpkgDagmlZDKsuXRXAqY1uC0epS9gY3OvKxFnL7QF+PVzjXQTs2nm23qalY3q5h9E6Pe
         BzDH281ZvmDgr7K5BH36oYaNvBXiL+WOE5Se9QWcJRaPlh0aTM7jR/2xMrjZHIDqi7Tc
         6D9K/Ixq17EluH8inlmLREjlyK8P0QVuggTx88vsAp/RBF5NJ8lrPJ/RMvrooISaSImR
         J7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1d4qcu7NZ7qgtgSI5XVhkuIhOwd763XYvi6GD6j9+gA=;
        b=uw9DQLGmWv0YL2kterbkBlBcPb2jXLfpAvh6tW4k1U/EG4EL2OXq2AS4dPhsVVDxvR
         4pxbwcdkXpaTocywjS6q3YJB3YeYyWcOgJaig96lX4l1CZwuMb/RW7kIArviR5bkcP4T
         0O40jbU4ov8Xmv3HYLbqhtaFBZZz559OKal/PYFK4tCnYbBrfPy/fATcspvdhRTpWQV0
         bMeD+Dhu41sMT98F3j04Y9M0nEhDHwdiQV08WZeWGqtOmeiRwIz/9NBoxjgmeZAmH1N1
         O1Yp6UJfvomAitfqoo8QCo4/Lv0wC9++r/Q/O2wpskMCYEwMr7Qp6Cpvn060J2fyTiSp
         AZ6w==
X-Gm-Message-State: AJIora+OrW4K7IJIw+k/XmZm/vEvSD9Y7d8K/uTV0mAqNhGZRX5yPiKI
	1fWadei0djTRR09ZC+nv8zNV/+L133LCQhsQRgjLmXo=
X-Google-Smtp-Source: 
 AGRyM1vcwgaHRW1rU4S2Q387CIQkopp3AYs9MMUK+JHxuDv3QzHiYTpJP2IJtHOJ9s5xbF/5t/K6jHr8y7/gEnI198Q=
X-Received: by 2002:a25:2a94:0:b0:668:bb54:76e6 with SMTP id
 q142-20020a252a94000000b00668bb5476e6mr16455839ybq.351.1655712479184; Mon, 20
 Jun 2022 01:07:59 -0700 (PDT)
MIME-Version: 1.0
From: Qorin Wu <qorin.wu@gmail.com>
Date: Mon, 20 Jun 2022 10:07:48 +0200
Message-ID: 
 <CAB5BoHvwikP4P8t_f8ffCTZfbWEam5h2ggNb6bQZBeGBtRx3Cg@mail.gmail.com>
Subject: Confirming email address
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002c091605e1dc9aa3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 08:08:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167086

--0000000000002c091605e1dc9aa3
Content-Type: text/plain; charset="UTF-8"



--0000000000002c091605e1dc9aa3
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000002c091605e1dc9aa3--

